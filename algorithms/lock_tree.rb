
# Implement locking in a binary tree. A binary tree node can be locked or unlocked only if all of its descendants or ancestors are not locked.

# Design a binary tree node class with the following methods:

#     is_locked, which returns whether the node is locked
#     lock, which attempts to lock the node. If it cannot be locked, then it should return false. Otherwise, it should lock it and return true.
#     unlock, which unlocks the node. If it cannot be unlocked, then it should return false. Otherwise, it should unlock it and return true.

# You may augment the node to add parent pointers or any other property you would like.

# You may assume the class is used in a single-threaded program, so there is no need for actual locks or mutexes.

# Each method should run in O(h), where h is the height of the tree.


class BinaryTreeNode

	def initialize parent = nil
		@is_locked = false
		@parent = parent
		@n_children_locked = 0
	end


	def lock
		if !is_locked? and !some_child_locked? and all_parents_unlocked?
			toggle_lock
			comunicate_my_locking_to_parents
			true
		else
			false
		end
	end

	def unlock
		if is_locked? and !some_child_locked? and all_parents_unlocked?
			toggle_lock
			comunicate_my_unlocking_to_parents
			true
		else
			false
		end
	end

	def is_locked?
		@is_locked
	end

	def some_child_locked?
		@n_children_locked > 0
	end

	def is_my_parent_locked?
		if @parent.nil?
			false
		else
			@parent.is_locked?
		end
	end

	def decrement_n_children_locked
		@n_children_locked -= 1
	end

	def increment_n_children_locked
		@n_children_locked += 1
	end

	def toggle_lock
		@is_locked = !@is_locked
	end

	def all_parents_unlocked?
		if @parent.nil?
			true
		else
			!is_my_parent_locked? &&	!@parent.is_my_parent_locked?
		end
	end

	def comunicate_my_locking_to_parents
		if !@parent.nil?
			@parent.increment_n_children_locked
			@parent.comunicate_my_locking_to_parents
		end
	end

	def comunicate_my_unlocking_to_parents
		if !@parent.nil?
			@parent.decrement_n_children_locked
			@parent.comunicate_my_unlocking_to_parents
		end
	end

end



RSpec.describe 'BinaryTreeNode' do 

	let(:n1){BinaryTreeNode.new}
	let(:n2){BinaryTreeNode.new n1}
	let(:n3){BinaryTreeNode.new n1}
	let(:n4){BinaryTreeNode.new n2}
	let(:n5){BinaryTreeNode.new n2}
	let(:n6){BinaryTreeNode.new n3}
	let(:n7){BinaryTreeNode.new n3}
	
	before(:each){
		n1 = BinaryTreeNode.new
		n2 = BinaryTreeNode.new n1
		n3 = BinaryTreeNode.new n1
		n4 = BinaryTreeNode.new n2
		n5 = BinaryTreeNode.new n2
		n6 = BinaryTreeNode.new n3
		n7 = BinaryTreeNode.new n3
	}

	describe 'is_my_parent_locked?' do

		it 'return false if parent is NOT locked' do
			result = n2.is_my_parent_locked?
			expect(result).to eq false
		end

		it 'return false if the node does not have parent ' do
			result = n1.is_my_parent_locked?
			expect(result).to eq false
		end

	end


	describe 'all_parents_unlocked?' do

		it 'return true if all parents are NOT locked' do
			result = n6.all_parents_unlocked?
			expect(result).to eq true
		end
		
	end

	describe 'lock' do

		it 'changes the property is_locked to true' do
			n5.lock
			expect(n5.is_locked?).to eq true
		end

		it 'returns true if node can be locked' do
			result = n5.lock
			expect(result).to eq true
		end

		it 'comunicate to all parents that is has been locked' do
			result = n5.lock
			expect(n2.some_child_locked?).to eq true
			expect(n1.some_child_locked?).to eq true
		end

		it 'does not lock if some child is locked and returns false' do
			n5.lock
			result = n1.lock
			expect(result).to eq false
			expect(n1.is_locked?).to eq false
		end

		it 'does not lock if some parent is locked and returns false' do
			n1.lock
			result = n5.lock
			expect(result).to eq false
			expect(n5.is_locked?).to eq false
		end

		it 'can lock simultanuesly two sibling nodes' do
			n2.lock
			n3.lock
			expect(n2.is_locked?).to eq true
			expect(n3.is_locked?).to eq true
		end
		
	end

	describe 'unlock' do

		it 'changes the property is_locked to false' do
			n2.lock
			n2.unlock
			expect(n2.is_locked?).to eq false
		end

		it 'returns true if node can be unlocked' do
			n2.lock
			result = n2.unlock
			expect(result).to eq true
		end

		it 'comunicate to all parents that is has been unlocked' do
			n5.lock
			result = n5.unlock
			expect(n2.some_child_locked?).to eq false
			expect(n1.some_child_locked?).to eq false
		end

		it 'does not unlock if some child is locked and returns false' do
			n5.lock
			result = n1.unlock
			expect(result).to eq false
			expect(n1.is_locked?).to eq false
		end

		it 'does not unlock if some parent is locked and returns false' do
			n1.lock
			result = n5.unlock
			expect(result).to eq false
			expect(n5.is_locked?).to eq false
		end

	end

	describe 'lock & unlock' do
		it 'keeps track of locked children preventing parent to be locked if any children is locked' do
			n5.lock
			n6.lock
			n7.lock

			expect(n1.lock).to eq false

			n5.unlock
			expect(n1.lock).to eq false

			n6.unlock
			expect(n1.lock).to eq false

			n7.unlock
			expect(n1.lock).to eq true
		end
	end


end